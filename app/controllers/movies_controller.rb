class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new()
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      actors = params[:actor_string].split(',').map(&:strip)

      actors.each do |name|
        actor = Actor.find_by(name: name)
        if actor
          actor.movies.push(@movie)
        else
          @movie.actors.create(name: name)
        end
      end

      flash.notice = 'The movie has been successfully added.'
      redirect_to movies_path
    else
      flash.now[:alert] = 'There was a problem saving the movie'
      render :new
    end
  end

  def search
    results = []
    results.concat(Movie.where('lower(title) LIKE ?', "%#{params[:search_string]}%".downcase))
    results.concat(Movie.where('lower(genre) LIKE ?', "%#{params[:search_string]}%".downcase))

    actors = Actor.where('lower(name) LIKE ?', "%#{params[:search_string]}%".downcase)
    actors.each do |actor|
      results.concat(actor.movies)
    end

    @results = results.uniq
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :description)
  end
end
