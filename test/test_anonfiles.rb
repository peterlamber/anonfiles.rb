require 'minitest/autorun'
require 'anonfiles'

class AnonfilesTest < Minitest::Test
  def test_find
    id = 'b4C03bGboc'
    assert_match /https:\/\/cdn-\d{1,}\.anonfiles.com\/#{id}\/\w{1,}\W\w{1,}\/test.jpg/,
    Anonfiles::Image.find(id)
  end

  def upload
    f = File.open('example/test.jpg')
    id = Anonfiles::Image.upload(f)
    assert_match /\w{1,}/, id
  end

end

# f=File.open('test.jpg')
# id = Anonfiles::Image.upload(f)
# p Anonfiles::Image.find(id)