#!/bin/bash

aws_doc_url="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html"
grafana_cloudwatch_url="https://raw.githubusercontent.com/grafana/grafana/main/pkg/tsdb/cloudwatch/metric_find_query.go"

aws=$(curl -s ${aws_doc_url} | grep "AWS/" | awk -F"\"code\">" '{print $2}' | awk -F"</code>" '{print $1}' | sort | uniq)
grafana=$(curl -s ${grafana_cloudwatch_url} | grep "AWS/" | awk -F"\"" '{print $2}' | sort | uniq)


for aws_namespace in ${aws[@]}
do

    if [[ ! "${grafana[@]}" =~ "${aws_namespace}" ]]; then
        echo ${aws_namespace}
    fi

done

