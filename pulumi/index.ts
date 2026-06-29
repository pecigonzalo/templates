import * as aws from "@pulumi/aws";

const bucket = new aws.s3.BucketV2("bucket", {
  tags: {
    Name: "bucket",
  },
});

export const bucketName = bucket.bucket;
