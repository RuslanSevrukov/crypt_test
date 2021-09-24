
class CryptocurrencyController < ApplicationController
  def full_info
    @result = RequesterService.currencies(params[:cc_tickers])
    return render(json: @result, status: 200) if @result
    render json: "error", status: 400
  #rescue
  #  render json: "unhandled error", status: 500
  end

  def specific_info
    @result = RequesterService.currencies(params[:cc_tickers], params[:fields])
    return render(json: @result, status: 200) if @result
    render json: "error", status: 400

    #rescue
  #  render json: "unhandled error", status: 500
  end

  def convert_cc_to_fiat
    render json: NomicsService.convert_cc_to_fiat(params[:cc_ticker], params[:fiat_ticker], params[:amount]), status: 200
  #rescue
  #  render json: "unhandled error", status: 500
  end

  def convert_cc_to_cc
    render json: NomicsService.convert_cc_to_cc(params[:cc_from_ticker], params[:cc_to_ticker], params[:amount]), status: 200
  #rescue
  #  render json: "unhandled error", status: 500
  end
end
