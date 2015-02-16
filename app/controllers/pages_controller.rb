class PagesController < ApplicationController
  def homepage
    @propositions = Proposition.order('created_at DESC').limit(5)
  end
end
