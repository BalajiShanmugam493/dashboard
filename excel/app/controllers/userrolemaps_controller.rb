class UserrolemapsController < ApplicationController
	before_action :authenticate_user, :only => [:index, :profile, :setting]
before_action :save_login_state, :only => [:login, :login_attempt]
 
	def index
		@operators1 = Userrolemap.where(:maproleID => 2).count
		@files1 = Itemqueuedetail.where(:queueStatusID => 1, :status => 'NOT ALLOCATED').count
		@progress1 = Itemqueuedetail.where(:queueStatusID => 1, :status => 'ALLOCATED').count

		@operators2 = Userrolemap.where(:maproleID => 3).count
		@files2 = Itemqueuedetail.where(:queueStatusID => 2, :status => 'NOT ALLOCATED').count
		@progress2 = Itemqueuedetail.where(:queueStatusID => 2, :status => 'ALLOCATED').count

		@operators3 = Userrolemap.where(:maproleID => 5).count
		@files3 = Itemqueuedetail.where(:queueStatusID => 4, :status => 'NOT ALLOCATED').count
		@progress3 = Itemqueuedetail.where(:queueStatusID => 4, :status => 'ALLOCATED').count

		@files4 = Itemqueuedetail.where(:queueStatusID => 9).count
		#@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel.to_csv }
  			format.xls 
		end

		#@excel1 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel1.to_csv }
  			format.xls 
		end
		
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel2.to_csv }
  			format.xls 
		end

		respond_to do |format|
  			format.html
  			format.csv { send_data @excel3.to_csv }
  			format.xls 
		end
	end

	def tdk
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def funding
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel1 =  Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')

	end

	def qc
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED"')
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel2 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def dispatched
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED"')
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel3 =  Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end
end
