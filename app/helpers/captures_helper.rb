module CapturesHelper
  def show_random_gif
    gifs = %w{
      https://media.giphy.com/media/11a9K7FLvTD9Kw/giphy.gif
      https://giphy.com/clips/duranduran-party-duran-anniverary-n6zAk3JSJaux51PhNm
      https://media.giphy.com/media/gaHgUZwYnyYb6/giphy.gif
      https://media.giphy.com/media/VDBc9ThWsIbwfmcvPs/giphy.gif
      https://media.giphy.com/media/Y2ho8NVsFTNSYnKmGV/giphy-downsized-large.gif

    }

    gifs[rand(gifs.length)]
  end

  def show_random_easter_gif
    gifs = %w{
    https://media.tenor.co/images/292397abd35cb49365f6a57e8bb8e47d/raw
    https://media3.giphy.com/media/l2R00wfa8fttlpRPG/giphy.gif?cid=790b7611daba2e4c365af6f26a7d9b76e84f174f0b8987e6&rid=giphy.gif
    https://media1.giphy.com/media/26gsiGuPlP95pumwE/giphy.gif?cid=790b7611373c059b8461eb195c190a6ba5603ba601491fd3&rid=giphy.gif
    https://media3.giphy.com/media/PDPkDE1UrKclW/giphy.gif?cid=790b7611c1a3446dc39f725c2721513d051aedb1ff245e5c&rid=giphy.gif
    }

    gifs[rand(gifs.length)]
  end
end
