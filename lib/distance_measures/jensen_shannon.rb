module DistanceMeasures
  def jensen_shannon(other)
    # dot_product = self.dot_product(other)
    # normalization = self.euclidean_normalize * other.euclidean_normalize

    # handle_nan(dot_product / normalization)
    js_distance(other)
  end

    def jensen_shannon_preprocess(other, buffer, index)
    # dot_product = self.dot_product(other)
    # normalization = self.euclidean_normalize * other.euclidean_normalize

    # handle_nan(dot_product / normalization)
    js_distance_preprocess(other, buffer, index)
  end


  def js_preprocess(preprocess)
    normalized = js_normalize
    preprocess[:normalized] << normalized
    preprocess[:entropy] << normalized.js_entropy
  end


  def js_distance(other_pattern)
        #    puts divergence(other_pattern)
        ::Math.sqrt(js_divergence(other_pattern))
      end #distance

  def js_distance_preprocess(other_pattern, buffer, index)
        #    puts divergence(other_pattern)
        ::Math.sqrt(js_divergence_preprocess(other_pattern, buffer, index))
      end #distance

      def js_divergence(other_pattern)
        a=js_normalize
        other_pattern=other_pattern.js_normalize

        #TODO this must be removed we MUST assume all the arrays have same length
          ab = Array.new
          #self was pattern
          #a was self
          a.each_with_index do |item,index|
            #other_pattern[] was other_pattern.pattern
            ab << ((item + other_pattern[index])*0.5)
          end

          ###Working
          #BUgged with 0 get NAN      ::JS.entropy(ab, ab.map{|item| Math.log(item,@normalize_base)}) - ((entropy+other_pattern.entropy)*0.5)
          # Note this is not an optimized version
          h1 = ab.js_entropy

          h2 = a.js_entropy

          h3 = other_pattern.js_entropy

          h1 - ((h2+h3)*0.5)

      end #divergence

#In this case the self and other are two array made by 3 items
#[[raw_data], [normalized_data], [entropy_data]]
      def js_divergence_preprocess(other_pattern, buffer, index)

        # puts self.inspect
        # puts other_pattern.inspect
        # puts index
        # puts buffer.keys
        #TODO this must be removed we MUST assume all the arrays have same length
          ab = Array.new
          other=other_pattern.js_normalize
          #self was pattern
          #a was self
          buffer[:normalized][index].each_with_index do |item,index|
            #other_pattern[] was other_pattern.pattern
            ab << ((item + other[index])*0.5)
          end

          ###Working
          #BUgged with 0 get NAN      ::JS.entropy(ab, ab.map{|item| Math.log(item,@normalize_base)}) - ((entropy+other_pattern.entropy)*0.5)
          # Note this is not an optimized version
          h1 = ab.js_entropy

          # h2 = a.js_entropy

           h3 = other.js_entropy

          h1 - ((buffer[:entropy][index]+h3)*0.5)

      end #divergence


      def js_normalize
          pattern_total = 0
          pattern=self.map do |item|
            #::Math.log(item+1.0,2) was ::Math.log(item+@normalize_pseudo_count,@normalize_base)
            partial = ::Math.log(item+1.0, 2)
            pattern_total+=partial
            partial
          end
          pattern.map do |item|
            item/pattern_total
          end
      end #normalize

      def js_entropy
        -self.inject(0) do |sum, item|
            #Math.log(x,2) was Math.log(x,@normalize_base)
          sum + (item==0.0 ? 0.0 : item * ::Math.log(item,2))
        end
      end #entropy

  end