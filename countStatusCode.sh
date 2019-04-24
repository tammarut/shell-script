#!/bin/bash
#Count numbers by pattern using grep, wc 

StatusCode0="StatusCode&quot;:&quot;0"
COUNT=$(grep -wr ${StatusCode0} test_casa_1Step.jtl | wc -l)
echo "StatusCode0 occured ${COUNT} times."

StatusCode2005="StatusCode&quot;:&quot;2005"
COUNT=$(grep -wr ${StatusCode2005} test_casa_1Step.jtl | wc -l)
echo "StatusCode2005 occured ${COUNT} times."

StatusCode1003="StatusCode&quot;:&quot;1003"
COUNT=$(grep -wr ${StatusCode1003} test_casa_1Step.jtl | wc -l)
echo "StatusCode1003 occured ${COUNT} times."

