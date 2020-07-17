# Lost your job and can't afford that Bucket anymore?

Fear not! just use `anonfiles` instead!  
up & download (for free!) to Anonfiles.com 

first  
`gem install 'anonfiles'`  
then  
```ruby
require 'anonfiles'

f = File.open('test.jpg')
id = Anonfiles::Image.upload(f)
p Anonfiles::Image.find(id)
> "https://cdn-13.anonfiles.com/b4C03bGboc/63bb18c1-1594984646/test.jpg"
```

*currently only supporting Images  
*please read their terms: https://anonfiles.com/terms