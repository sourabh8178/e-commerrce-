class AddressesController < InheritedResources::Base

  # GET /producs or /producs.json
  def index
    @addresses = Address.all
  end

  # GET /Addresss/1 or /Addresss/1.json
  def show
    @address = Address.find_by(id: params[:id])
  end

  # GET /Addresss/new
  def new
    @address = Address.new
  end

  # GET /Addresss/1/edit
  def edit
  end

  # POST /Addresss or /producs.json
  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    respond_to do |format|
      if @address.save
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
        redirect_to "/success"

    end
  end

  # PATCH/PUT /producs/1 or /producs/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to address_url(@address), notice: "address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producs/1 or /producs/1.json
  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:email, :phone, :line1, :line2, :landmark, :state, :pincode, :country)
    end
end
