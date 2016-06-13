class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	before_destroy :ensure_not_referenced_by_any_line_item



	private

	# to ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Product sedang di referensikan oleh Line Item')
			return false
		end
	end

end
