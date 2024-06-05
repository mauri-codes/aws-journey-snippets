#!/bin/bash

echo ACCESS_KEY_ID: `terraform output access_keys_id`
echo ACCESS_KEY_SECRET: `terraform output access_keys_secret`
echo USER_PASSWORD: `terraform output user_password`
