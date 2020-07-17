require 'anonfiles'

f = File.open('test.jpg')
id = Anonfiles::Image.upload(f)
p Anonfiles::Image.find(id)