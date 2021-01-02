module Search
    class SearchArticle
      def initialize(params)
        @params = params
        @title = Article.arel_table[:title]
        @description = Article.arel_table[:description]
      end
  
      def find
        if(@params.has_key?(:search))
          Article.where(@description.matches("%#{@params[:search]}%"))
                 .or(Article.where(@title.matches("%#{@params[:search]}%")))
                 .paginate(page: @params[:page],per_page:5)
        else
          Article.paginate(page: @params[:page],per_page:5)
        end
      end
    end
  end