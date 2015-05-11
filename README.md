S3Refresh
=========

Purpose
-------
Create a single web page (index.html) to view an unstructured, unlabeled collection of images using AWS S3's static website hosting feature.

Inputs
------
1. A valid existing s3 bucket name 
2. The absolute path of a local directory of images (GIF, PNG, JPG, JPEG)

Outputs
-------
1. Images are uploaded to the bucket (but old images are ignored).
2. An ```index.html``` page with image tags for the uploaded files.

Requirements
------------
AWS S3 credentials, assumed to be in the ```~/.aws/credentials``` location.
