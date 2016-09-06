#!/usr/bin/jjs 
var user = $ENV.USER;
var cmd = "docker build -t ${user}/psql_financials .";
var System = Java.type("java.lang.System");

$EXEC(cmd);
print($OUT);
