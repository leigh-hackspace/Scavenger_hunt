module CapturesHelper
  def show_random_gif
    gifs = %w{
      https://media.giphy.com/media/9JrvLb0fnrn7k1ZjhX/giphy.gif
      https://media.giphy.com/media/5dZYGvxrjfthsL9xdN/giphy.gif
      https://media.giphy.com/media/bxJRigovhEPhC/giphy.gif
    }

    gifs[rand(gifs.length)]
  end

end
