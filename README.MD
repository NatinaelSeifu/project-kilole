# Kilole Project

##Introduction

This project demonstrates a near real-time data pipeline for IoT devices. The data pipeline uses AWS Services and Terraform to automate the deployment of the AWS resources.


## Service Breakdown

The project uses the following tools:

### AWS IoT Core

We can register an IoT device using this service. In addition, we can create rules on how the data coming from the IoT device is handled. 

### Amazon Kinesis Data Firehose

We used this service to ingest the data from the IoT device into a specific data storage service.

### Amazon Simple Storage Service (S3)

We used this service to store the data ingested from the IoT device.

### Amazon Athena

We used this service to query the data stored in S3 and prepare the data for analysis.

### PowerBI

We used this service to visualize the IoT device data.


