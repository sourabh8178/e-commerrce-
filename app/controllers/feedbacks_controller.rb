class FeedbacksController < InheritedResources::Base
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1 or /feedbacks/1.json
  def show
    @feedback = Feedback.find_by(id: params[:id])
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    render layout: false
  end

  # def create

  # @user = User.new(user_params)

  # if @user.save
  #     flash[:notice] = "You have signed up successdully"
  #     flash[:color] = "valid"
  # else
  #     flash[:notice] = "Invalid Input!"
  #     flash[:color] = "invalid"
  #     render "new"
  # end


  # GET /feedbacks/1/edit
  def edit
  end

  private

    def feedback_params
      params.require(:feedback).permit(:product_id, :user_id, :body, :rate)
    end

end
