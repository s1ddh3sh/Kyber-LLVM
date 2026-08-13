#pragma once

#include <cctype>
#include <cstdint>
#include <fstream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

struct JsonValue {
  bool isString = false;
  std::string strVal;
  // long long intVal = 0;
  uint64_t uintVal = 0;
  bool negative = false; // true if the literal had a leading '-'

  std::string asString() const {
    return isString ? strVal : std::to_string(uintVal);
  }

  uint64_t asUInt64() const { return isString ? std::stoull(strVal) : uintVal; }

  long long asInt() const {
    if (isString)
      return std::stoll(strVal);
    if (!negative && uintVal > (uint64_t)INT64_MAX)
      throw std::out_of_range("JsonValue::asInt: value " +
                              std::to_string(uintVal) +
                              " does not fit in a signed 64-bit int; "
                              "use asUInt64() instead");
    return negative ? -(long long)uintVal : (long long)uintVal;
  }
};

using JsonObject = std::vector<std::pair<std::string, JsonValue>>;

inline bool jsonHas(const JsonObject &obj, const std::string &key) {
  for (auto &kv : obj)
    if (kv.first == key)
      return true;
  return false;
}

inline const JsonValue &jsonGet(const JsonObject &obj, const std::string &key) {
  for (auto &kv : obj)
    if (kv.first == key)
      return kv.second;
  throw std::runtime_error("Key not found in JSON object: " + key);
}

inline void skipWs(const std::string &s, size_t &i) {
  while (i < s.size() && std::isspace((unsigned char)s[i]))
    i++;
}

inline std::string parseJsonString(const std::string &s, size_t &i) {
  // assumes s[i] == '"'
  i++; // skip opening quote
  std::string out;
  while (i < s.size() && s[i] != '"') {
    if (s[i] == '\\' && i + 1 < s.size()) {
      i++;
      out.push_back(s[i]);
    } else {
      out.push_back(s[i]);
    }
    i++;
  }
  if (i >= s.size())
    throw std::runtime_error("Unterminated string in JSON line: " + s);
  i++; // skip closing quote
  return out;
}

inline JsonObject parseJsonLine(const std::string &line) {
  JsonObject obj;
  size_t i = 0;
  skipWs(line, i);
  if (i >= line.size() || line[i] != '{')
    throw std::runtime_error("Expected '{' in JSON line: " + line);
  i++; // skip '{'

  while (true) {
    skipWs(line, i);
    if (i < line.size() && line[i] == '}') {
      i++;
      break;
    }
    if (i >= line.size() || line[i] != '"')
      throw std::runtime_error("Expected key string in JSON line: " + line);

    std::string key = parseJsonString(line, i);
    skipWs(line, i);
    if (i >= line.size() || line[i] != ':')
      throw std::runtime_error("Expected ':' after key '" + key +
                               "' in: " + line);
    i++; // skip ':'
    skipWs(line, i);

    JsonValue val;
    if (i < line.size() && line[i] == '"') {
      val.isString = true;
      val.strVal = parseJsonString(line, i);
    } else {
      // parse integer (optionally negative)
      bool neg = false;
      size_t start = i;
      if (i < line.size() && (line[i] == '-' || line[i] == '+')) {
        neg = (line[i] == '-');
        i++;
      }
      size_t digitsStart = i;
      while (i < line.size() && std::isdigit((unsigned char)line[i]))
        i++;
      if (i == digitsStart)
        throw std::runtime_error("Expected value for key '" + key +
                                 "' in: " + line);
      val.isString = false;
      val.negative = neg;
      // Parse magnitude as unsigned to support values up to UINT64_MAX
      // (e.g. raw 64-bit limb patterns), which stoll cannot represent.
      val.uintVal = std::stoull(line.substr(digitsStart, i - digitsStart));
    }

    obj.push_back({key, val});

    skipWs(line, i);
    if (i < line.size() && line[i] == ',') {
      i++;
      continue;
    }
    skipWs(line, i);
    if (i < line.size() && line[i] == '}') {
      i++;
      break;
    }
    throw std::runtime_error("Expected ',' or '}' in JSON line: " + line);
  }

  return obj;
}

// Reads every line of `path` as a separate flat JSON object. Blank lines
// are skipped. Throws std::runtime_error if the file cannot be opened.
inline std::vector<JsonObject> readJsonLines(const std::string &path) {
  std::ifstream in(path);
  if (!in)
    throw std::runtime_error("Could not open JSON testcase file: " + path);

  std::vector<JsonObject> result;
  std::string line;
  while (std::getline(in, line)) {
    // trim trailing whitespace/CR
    while (!line.empty() && std::isspace((unsigned char)line.back()))
      line.pop_back();
    if (line.empty())
      continue;
    result.push_back(parseJsonLine(line));
  }
  return result;
}