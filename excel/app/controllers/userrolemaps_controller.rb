class UserrolemapsController < ApplicationController
	before_action :authenticate_user, :only => [:index, :profile, :setting]
#before_action :save_login_state, :only => [:login, :login_attempt]
 
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
		if params[:accession] != ''
		@accession =	params[:accession]
		else
		@accession	= ".*"
		end
		if params[:journal] != ''
		@journal =	params[:journal]
		else
		@journal = ".*"
		end
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED") AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND Date BETWEEN ? AND ?) ',"#{@journal}","#{@accession}" ,"#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")
			else
				Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
			end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def funding
		if params[:accession] != ''
		@accession =	params[:accession]
		else
		@accession	= ".*"
		end
		if params[:journal] != ''
		@journal =	params[:journal]
		else
		@journal = ".*"
		end
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED") AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND Date BETWEEN ? AND ?)',"#{@journal}" ,"#{@accession}" ,"#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")
			else
				Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')
			end	
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel1 =  Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')

	end

	def qc
		if params[:accession] != ''
		@accession =	params[:accession]
		else
		@accession	= ".*"
		end
		if params[:journal] != ''
		@journal =	params[:journal]
		else
		@journal = ".*"
		end
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED") AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND Date BETWEEN ? AND ?)',"#{@journal}" ,"#{@accession}","#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")
		else
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED"')
		end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel2 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def dispatched
		if params[:accession] != ''
		@accession =	params[:accession]
		else
		@accession	= ".*"
		end
		if params[:journal] != ''
		@journal =	params[:journal]
		else
		@journal = ".*"
		end
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED") AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND Date BETWEEN ? AND ?)',"#{@journal}","#{@accession}" ,"#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")
		else
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED"')
		end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel3 =  Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def authors
		if params[:accession] != ''
		@accession =	params[:accession]
		else
		@accession	= ".*"
		end
		if params[:journal] != ''
		@journal =	params[:journal]
		else
		@journal = ".*"
		end
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 5 AND itemqueuedetails.status = "NOT ALLOCATED") AND (journalSequence REGEXP ?  AND accessionItemNo = ? AND Date BETWEEN ? AND ?)',"#{@journal}", "#{@accession}","#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")		
		else
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 5 AND itemqueuedetails.status = "NOT ALLOCATED"')
		end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel4 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 5 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def addresses
		@details = if params[:start_date]
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID').where('(itemqueuedetails.queueStatusID = 6 AND itemqueuedetails.status = "NOT ALLOCATED") AND (accessionItemNo = ? OR Date BETWEEN ? AND ?)',"#{params[:accession]}" ,"#{params[:start_date][:year]}-#{params[:start_date][:month]}-#{params[:start_date][:day]}","#{params[:end_date][:year]}-#{params[:end_date][:month]}-#{params[:end_date][:day]}")		
		else
			Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 6 AND itemqueuedetails.status = "NOT ALLOCATED"')
		end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @details.to_csv }
  		#	format.xls 
		#end
		@excel5 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 6 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def welcome
	end

	def index1
		@operators5 = Userrolemap.where(:maproleID => 7).count
		@files5 = Itemqueuedetail.where(:queueStatusID => 5, :status => 'NOT ALLOCATED').count
		@progress5 = Itemqueuedetail.where(:queueStatusID => 5, :status => 'ALLOCATED').count

		@operators6 = Userrolemap.where(:maproleID => 6).count
		@files6 = Itemqueuedetail.where(:queueStatusID => 6, :status => 'NOT ALLOCATED').count
		@progress6 = Itemqueuedetail.where(:queueStatusID => 6, :status => 'ALLOCATED').count

		@operators3 = Userrolemap.where(:maproleID => 5).count
		@files3 = Itemqueuedetail.where(:queueStatusID => 4, :status => 'NOT ALLOCATED').count
		@progress3 = Itemqueuedetail.where(:queueStatusID => 4, :status => 'ALLOCATED').count

		@files4 = Itemqueuedetail.where(:queueStatusID => 9).count
		#@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel4.to_csv }
  			format.xls 
		end

		#@excel1 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel5.to_csv }
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
	def tdk_operators
		@details = User.where(:maproleID => 2)
	end

	def funding_operators
		@details = User.where(:maproleID => 3)
	end

	def qc_operators
		@details = User.where(:maproleID => 5)
	end

	def authors_operators
		@details = User.where(:maproleID => 7)
	end

	def addresses_operators
		@details = User.where(:maproleID => 6)
	end

	def show
		@details = Itemdetail.find(params[:id])
	end
end
