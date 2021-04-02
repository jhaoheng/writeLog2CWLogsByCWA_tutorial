SHELL := /bin/bash
.PHONY: start stop status loginfo version

start:
	@/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

stop:
	@/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a stop -m onPremise -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

status:
	@/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status -m onPremise -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

loginfo:
	@tail -f /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log

version:
	@/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent --version