class StoreProduct < ActiveRecord::Base
		#驗證價格不能是英文, 不能小於0
	validates_numericality_of :price, :only_integer => true, :greater_than_or_equal_to => 0
	#驗證商品名稱為必填
	validates :name, presence: 'true'
end
