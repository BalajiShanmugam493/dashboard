class UserrolemapsController < ApplicationController
	before_action :authenticate_user, :only => [:index, :profile, :setting, :index1]
#before_action :save_login_state, :only => [:login, :login_attempt]
 
	def index
		@role1 = Role.select("roleID").where(roleName: 'TKA').map(&:roleID).uniq
		@operators1 = User.where("mapRoleID = ?", @role1 ).count
		@status1 = Role.select("queueStatusID").where(roleName: 'TKA').map(&:queueStatusID).uniq
		@files1 = Itemqueuedetail.where("queueStatusID =?",@status1).count
		@progress1 = Itemqueuedetail.where("queueStatusID =? AND status = '1' ",@status1).count

		@role2 = Role.select("roleID").where(roleName: 'Funding').map(&:roleID).uniq
		@operators2 = User.where("mapRoleID =?" , @role2).count
		@status2 = Role.select("queueStatusID").where(roleName: 'Funding').map(&:queueStatusID).uniq
		@files2 = Itemqueuedetail.where("queueStatusID =?",@status2).count
		@progress2 = Itemqueuedetail.where("queueStatusID = ? AND status ='1'", @status2).count

		@role3 = Role.select("roleID").where(roleName: 'QCA').map(&:roleID).uniq
		@operators3 = User.where("mapRoleID = ?", @role3).count
		@status3 = Role.select("queueStatusID").where(roleName: 'QCA').map(&:queueStatusID).uniq
		@files3 = Itemqueuedetail.where("queueStatusID =?",@status3).count
		@progress3 = Itemqueuedetail.where("queueStatusID =? AND status ='1'",@status3).count

		@status4 = Role.select("queueStatusID").where(roleName: 'Completed').map(&:queueStatusID).uniq
		@files4 = Itemqueuedetail.where("queueStatusID =?",@status4).count
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

	def qcd
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
		@status7 = Role.select("queueStatusID").where(roleName: 'QCD').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status7[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status7[0].to_s).where("itemqueuedetails.status = '0'")
			end
		@excel6 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status7[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status7[0].to_s).where("itemqueuedetails.status = '0'")
			end
		
		
	end

	def dispatchedd
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
		@status8 = Role.select("queueStatusID").where(roleName: 'CompletedD').map(&:queueStatusID).uniq
		@details = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status8[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status8[0].to_s).where("itemqueuedetails.status = '0'")
			end
		@excel7 = if params[:datetimepicker1]
			Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status8[0].to_s).where("itemqueuedetails.status = '0' AND (journalSequence REGEXP ? AND accessionItemNo REGEXP ? AND itemdetails.created_at BETWEEN ? AND ?) ","#{@journal}","#{@accession}" ,"#{params[:datetimepicker1]}","#{params[:datetimepicker2]}")
			else
				Itemdetail.joins("INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID AND itemqueuedetails.queueStatusID = ", @status8[0].to_s).where("itemqueuedetails.status = '0'")
			end
		
	end
	

	def welcome
	end

	def index1
		@role5 = Role.select("roleID").where(roleName: 'Author').map(&:roleID).uniq
		@operators5 = User.where("maproleID =?", @role5).count
		@status5 = Role.select("queueStatusID").where(roleName: 'Author').map(&:queueStatusID).uniq
		@files5 = Itemqueuedetail.where("queueStatusID =?", @status5).count
		@progress5 = Itemqueuedetail.where("queueStatusID =? AND status ='1'",@status5).count

		@role6 = Role.select("roleID").where(roleName: 'Address').map(&:roleID).uniq
		@operators6 = User.where("maproleID =?",@role6).count
		@status6 = Role.select("queueStatusID").where(roleName: 'Address').map(&:queueStatusID).uniq
		@files6 = Itemqueuedetail.where("queueStatusID =?",@status6).count
		@progress6 = Itemqueuedetail.where("queueStatusID =? AND status ='1'",@status6).count

		@role7 = Role.select("roleID").where(roleName: 'QCD').map(&:roleID).uniq
		@operators7 = User.where("maproleID =?",@role7).count
		@status7 = Role.select("queueStatusID").where(roleName: 'QCD').map(&:queueStatusID).uniq
		@files7 = Itemqueuedetail.where("queueStatusID =?",@status7).count
		@progress7 = Itemqueuedetail.where("queueStatusID =? AND status ='1'",@status7).count

		@status8 = Role.select("queueStatusID").where(roleName: 'CompletedD').map(&:queueStatusID).uniq
		@files8 = Itemqueuedetail.where("queueStatusID =?",@status8).count
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
  			format.csv { send_data @excel6.to_csv }
  			format.xls 
		end

		respond_to do |format|
  			format.html
  			format.csv { send_data @excel7.to_csv }
  			format.xls 
		end
	end
	def tdk_operators
		@role1 = Role.select("roleID").where(roleName: 'TKA').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role1)
	end

	def funding_operators
		@role2 = Role.select("roleID").where(roleName: 'Funding').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role2)
	end

	def qc_operators
		@role3 = Role.select("roleID").where(roleName: 'QCA').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role3)
	end

	def qcd_operators
		@role7 = Role.select("roleID").where(roleName: 'QCD').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role7)
	end


	def authors_operators
		@role5 = Role.select("roleID").where(roleName: 'Author').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role5)
	end

	def addresses_operators
		@role6 = Role.select("roleID").where(roleName: 'Address').map(&:roleID).uniq
		@details = User.where("maproleID =?",@role6)
	end

	def show
		#render :layout => 'layout1'
		@details = Itemstatus.where(:itemID => params[:id])
		render layout: 'layout1'
		
	end

	def updateDispatched
		#Itemqueuedetail.update(params[:id], priority: params[:priority])
		#Itemdetail.update(params[:id], priority: params[:priority])
		#Item = Itemqueuedetail.find_by_itemID(params[:id])
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		#Item.update(:priority => params[:priority])
		redirect_to :action => 'dispatched'
	end

	def updateDispatchedd
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'dispatchedd'
	end
	

	def updateTdk
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'tdk'
	end

	def updateFunding
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'funding'
	end

	def updateQc
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'qc'
	end

	def updateQcd
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'qcd'
	end
 	
	def updateAuthors
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'authors'
	end

	def updateAddresses
		@item = Itemqueuedetail.where(itemID: params[:id]).update_all(priority: params[:priority])
		@item1 = Itemdetail.where(itemID:params[:id]).update_all(priority:params[:priority])
		redirect_to :action => 'addresses'
	end
end

