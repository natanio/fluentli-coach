# set s3 path
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:id/:style/:filename'

# set s3 server
#Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'