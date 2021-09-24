class CryptocurrencyController < ApplicationController
  def full_info
    render json: RequesterHelper.currencies params[:cc_tickers]
  rescue
    render json: "unhandled error", status: 500
  end

  def specific_info
    RequesterHelper.currencies params[:cc_tickers], params[:fields]
  rescue
    render json: "unhandled error", status: 500
  end

  def convert_cc_to_fiat
    NomicsHelper.convert_cc_to_fiat params[:cc_ticker], params[:fiat_ticker], params[:amount]
  rescue
    render json: "unhandled error", status: 500
  end

  def convert_cc_to_cc
    NomicsHelper.convert_cc_to_cc params[:cc_from_ticker], params[:cc_to_ticker], params[:amount]
  rescue
    render json: "unhandled error", status: 500
  end
end
