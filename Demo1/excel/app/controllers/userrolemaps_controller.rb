class UserrolemapsController < ApplicationController
	before_action :authenticate_user, :only => [:index, :profile, :setting, :index1]
#before_action :save_login_state, :only => [:login, :login_attempt]
 
	def index
		@role1 = Role.select("roleID").where(roleName: 'TKA').map(&:roleID).uniq
		@operators1 = User.where("mapRoleID = ?", @role1 ).count
		@files1 = Itemqueuedetail.where(:queueStatusID => 1).count
		@progress1 = Itemqueuedetail.where(:queueStatusID => 1, :status => '1').count

		@role2 = Role.select("roleID").where(roleName: 'Funding').map(&:roleID).uniq
		@operators2 = User.where("mapRoleID =?" , @role2).count
		@files2 = Itemqueuedetail.where(:queueStatusID => 2).count
		@progress2 = Itemqueuedetail.where(:queueStatusID => 2, :status => '1').count

		@role3 = Role.select("roleID").where(roleName: 'QCA').map(&:roleID).uniq
		@operators3 = User.where("mapRoleID = ?", @role3).count
		@files3 = Itemqueuedetail.where(:queueStatusID => 4).count
		@progress3 = Itemqueuedetail.where(:queueStatusID => 4, :status => '1').count

		@files4 = Itemqueuedetail.where(:queueStatusID => 9).count
		#@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "0"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel.to_csv }
  			format.xls 
		end

		#@excel1 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "0"')
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
		@status1 = Role.select("queueStatusID").where(roleName: 'TKA').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status1[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status1[0].to_s).where("itemqueuedetails.status = '1'")
			end
		@excel = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status1[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status1[0].to_s).where("itemqueuedetails.status = '1'")
			end
		#respond_to do |format|
  		#	format.html
  		#	format.csv { send_data @excel.to_csv }
  		#	format.xls 
		#end
		
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
		@status2 = Role.select("queueStatusID").where(roleName: 'Funding').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status2[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status2[0].to_s).where("itemqueuedetails.status = '1'")
			end
		@excel1 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status2[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status2[0].to_s).where("itemqueuedetails.status = '1'")
			end
		
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
		@status3 = Role.select("queueStatusID").where(roleName: 'QCA').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status3[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status3[0].to_s).where("itemqueuedetails.status = '1'")
			end
		@excel2 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status3[0].to_s).where("itemqueuedetails.status = '1' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status3[0].to_s).where("itemqueuedetails.status = '1'")
			end
		
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
		@status4 = Role.select("queueStatusID").where(roleName: 'Completed').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status4[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status4[0].to_s).where("itemqueuedetails.status = '0'")
			end
		@excel3 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status4[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status4[0].to_s).where("itemqueuedetails.status = '0'")
			end
		
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
		@status5 = Role.select("queueStatusID").where(roleName: 'Author').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status5[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status5[0].to_s).where("itemqueuedetails.status = '0'")
			end
		@excel4 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status5[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status5[0].to_s).where("itemqueuedetails.status = '0'")
			end
		
	end

	def addresses
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
		@status6 = Role.select("queueStatusID").where(roleName: 'Address').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status6[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status6[0].to_s).where("itemqueuedetails.status = '0'")
			end
		@excel5 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status6[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status6[0].to_s).where("itemqueuedetails.status = '0'")
			end
		
		
	end

	def welcome
	end

	def index1
		@role5 = Role.select("roleID").where(roleName: 'Author').map(&:roleID).uniq
		@operators5 = User.where("maproleID =?", @role5).count
		@files5 = Itemqueuedetail.where(:queueStatusID => 5).count
		@progress5 = Itemqueuedetail.where(:queueStatusID => 5, :status => '1').count

		@role6 = Role.select("roleID").where(roleName: 'Address').map(&:roleID).uniq
		@operators6 = User.where("maproleID =?",@role6).count
		@files6 = Itemqueuedetail.where(:queueStatusID => 6).count
		@progress6 = Itemqueuedetail.where(:queueStatusID => 6, :status => '1').count

		@operators3 = User.where(:maproleID => 5).count
		@files3 = Itemqueuedetail.where(:queueStatusID => 4).count
		@progress3 = Itemqueuedetail.where(:queueStatusID => 4, :status => '1').count

		@files4 = Itemqueuedetail.where(:queueStatusID => 9).count
		#@excel = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "0"')
		respond_to do |format|
  			format.html
  			format.csv { send_data @excel4.to_csv }
  			format.xls 
		end

		#@excel1 = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "0"')
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
		#render :layout => 'layout1'
		@details = Itemstatus.where(:itemID => params[:id])
		render layout: 'layout1'
		
	end

	def updateDispatched
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'dispatched'
	end

	def updateTdk
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'tdk'
	end

	def updateFunding
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'funding'
	end

	def updateQc
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'qc'
	end

	def updateAuthors
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'authors'
	end

	def updateAddresses
		Itemdetail.update(params[:id], priority: params[:priority])
		redirect_to :action => 'addresses'
	end
end

