function awsauth
    set -ge AWS_ACCESS_KEY_ID
    set -ge AWS_SECRET_ACCESS_KEY
    set -ge AWS_SESSION_TOKEN
    set payload (aws sts get-session-token \
        --serial-number $MFA_DEVICE_ARN \
        --token-code (op item get "AWS - CLI Access" --otp) \
        --profile personal)
    if test $status -ne 0
        echo "Failed to authenticate"
        return 1
    end
    set parsed (echo $payload | jq -r '.Credentials.AccessKeyId, .Credentials.SecretAccessKey, .Credentials.SessionToken, .Credentials.Expiration')
    set -gx AWS_ACCESS_KEY_ID $parsed[1]
    set -gx AWS_SECRET_ACCESS_KEY $parsed[2]
    set -gx AWS_SESSION_TOKEN $parsed[3]
end

