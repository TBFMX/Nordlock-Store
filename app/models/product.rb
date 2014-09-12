class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  #validates :title, :description, presence: true
  #validates :unit_price, numericality: {greater_than_or_equal_to: 0.01}
  #validates :image_url, allow_blank: true, format: {
  #  with:    %r{\.(gif|jpg|png)\Z}i,
  #  message: 'must be a URL for GIF, JPG or PNG image.'
  #}
  validates :title, length: {minimum: 3}

  def self.latest
    Product.order(:updated_at).last
  end
  def self.query(product,category)

        @aux= " category = ? "
        @aux2= Array.new
        @aux2 [1] = category
        @cont = 2

    unless product.nil?

        if !product[:washer_size].blank?
            @aux= @aux + 'and washer_size = ? '
            @aux2[@cont]=  product[:washer_size].to_s
            @cont = @cont + 1
        end
        if !product[:bolt_size_metric].blank?
            @aux= @aux + 'and bolt_size_metric = ? '
            @aux2[@cont]=  product[:bolt_size_metric].to_s
            @cont = @cont + 1
        end
        if !product[:bolt_size_unc].blank?
            @aux= @aux + 'and bolt_size_unc = ? '
            @aux2[@cont]=  product[:bolt_size_unc].to_s
            @cont += 1
        end

# if !diameter_inside_min.blank?
#             @aux= @aux + 'and diameter_inside <= ? '
#             @aux2[@cont]=  product[:diameter_inside]
#             @cont += 1
#         end
# if !diameter_inside_max.blank?
#             @aux= @aux + 'and diameter_inside >= ? '
#             @aux2[@cont]=  product[:diameter_inside]
#             @cont += 1
#         end
#     if !diameter_outside_min.blank?
#             @aux= @aux + 'and diameter_outside <= ? '
#             @aux2[@cont]=  product[:diameter_outside]
#             @cont += 1
#         end
#     if !diameter_outside_max.blank?
#             @aux= @aux + 'and diameter_outside >|= ? '
#             @aux2[@cont]=  product[:diameter_outside]
#             @cont += 1
#         end
        if !product[:diameter_inside].blank?
            @aux= @aux + 'and diameter_inside = ? '
            @aux2[@cont]=  product[:diameter_inside].to_s
            @cont += 1
        end
        if !product[:diameter_outside].blank?
            @aux= @aux + 'and diameter_outside = ? '
            @aux2[@cont]=  product[:diameter_outside].to_s
            @cont += 1
        end

        if !product[:thickness_t].blank?
            @aux= @aux + 'and thickness_t = ? '
            @aux2[@cont]=  product[:thickness_t].to_s
            @cont += 1
        end
       # if !product[:min_package].blank?
       #      @aux= @aux + 'and min_package = ? '
       #      @aux2[@cont]=  product[:min_package]
       #      @cont += 1
       #  end

    # if !product[:weight].blank?
    #         @aux= @aux + 'and weight = ? '
    #         @aux2[@cont]=  product[:weight]
    #         @cont += 1
    #     end
    # if !product[:art_no].blank?
    #         @aux= @aux + 'and art_no = ? '
    #         @aux2[@cont]=  product[:art_no]
    #         @cont += 1
    #     end
        if @aux
        #puts @cont    
             @aux2[0]=@aux

             puts"--------- arreglo where --------"
             puts @aux2.inspect
             puts"--------------------------------"

          where @aux2
        else
          scoped
        end
      end    
    end
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
