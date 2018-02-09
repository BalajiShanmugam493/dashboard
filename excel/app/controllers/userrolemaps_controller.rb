class UserrolemapsController < ApplicationController
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
	end

	def tdk
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 1 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def funding
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 2 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def qc
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 4 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end

	def dispatched
		@details = Itemdetail.joins('INNER JOIN itemqueuedetails ON itemqueuedetails.itemID = itemdetails.itemID WHERE itemqueuedetails.queueStatusID = 9 AND itemqueuedetails.status = "NOT ALLOCATED"')
	end
end
