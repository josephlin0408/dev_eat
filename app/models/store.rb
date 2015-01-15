class Store < ActiveRecord::Base
	#驗證價格不能是英文, 不能小於0
	validates_numericality_of :zip, :tel, :owner_user, :only_integer => true, :greater_than_or_equal_to => 0
	#驗證為必填
	validates :address, :name, presence: 'true'
	#驗證電話號碼長度
	validates_length_of :tel, minimum: 7, maximum: 11
end