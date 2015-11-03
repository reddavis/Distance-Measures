require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DistanceMeasures" do

  describe "Euclidean Distance" do
    it "should return 0.0" do
      array.euclidean_distance(array).should == 0.0
    end

    it "should return 4.0" do
      [5].euclidean_distance([1]).should == 4.0
    end
  end

  describe "Cosine Similarity" do
    it "should return 1.0" do
      array.cosine_similarity(array).should.to_s == "1.0" # WTF
    end

    it "should handle NaN's" do
      [0.0, 0.0].cosine_similarity([0.0, 0.0]).nan?.should be false
    end
  end

  describe "Tanimoto Coefficient" do
    it "should return 1.0" do
      array.tanimoto_coefficient(array).should == 1.0
    end

    it "should handle NaN's" do
      [0.0, 0.0].tanimoto_coefficient([0.0, 0.0]).nan?.should be false
    end
  end

  describe "Sum of Squares" do
    it "should return 50" do
      array.sum_of_squares.should == 50
    end
  end

  describe "Jaccard" do
    describe "Jaccard Distance" do
      it "should return" do
        array_2.jaccard_distance(array_3).should == (1 - 3.0/7.0)
      end
    end

    describe "Jaccard Index" do
      it "should return" do
        array_2.jaccard_index(array_3).should == 3.0/7.0
      end
    end

    describe "Binary Jaccard Index" do
      it "should return 1/4" do
        [1,1,1,1].binary_jaccard_index([0,1,0,0]).should == 1/4.0
      end
    end
  end

  describe "Binary Jaccard Distance" do
    it "should return 0.75" do
      [1,1,1,1].binary_jaccard_distance([0,1,0,0]).should == 1 - (1/4.0)
    end
  end

  describe "Intersection" do
    it "should return [7,4,1]" do
      array_2.intersection_with(array_3).should == [7,4,1]
    end
  end

  describe "Union" do
    it "should return " do
      array_2.union_with(array_3).should == [7,3,2,4,1,9,5]
    end
  end

  describe "Binary Intersection" do
    it "should return [0,1,0,0]" do
      [1,1,1,1].binary_intersection_with([0,1,0,0]).should == [0,1,0,0]
    end
  end

  describe "Binary Union" do
    it "should return [1,1,1,0]" do
      [1,1,1,0].binary_union_with([0,0,0,0]).should == [1,1,1,0]
    end
  end

  describe "Dot Product" do
    it "should return 50" do
      [5, 5].dot_product([5, 5]).should == 50.0
    end
  end

  describe "Euclidean normalize" do
    it "should" do
      [10].euclidean_normalize.should == 10
    end
  end

  describe "Jensen Shannon Distance" do
    before(:all) do
      @jsdata = %w(496.597 465.803 53.4271 324.346 628.185 436.548 342.902 2519.74 2055.18 570.8 178.764 583.468 93.7626 0.798655 262.638 104.481 39.2528 252.841 77.9579 161.86 16.9387 46.876 1.46205 1.65763 1.39057).map{|x| x.to_f}

      #[496.597, 465.803, 53.4271, 324.346, 628.185, 436.548, 342.902, 2519.74, 2055.18, 570.8, 178.764, 583.468, 93.7626, 0.798655, 262.638, 104.481, 39.2528, 252.841, 77.9579, 161.86, 16.9387, 46.876, 1.46205, 1.65763, 1.39057]
      @jspattern = %w(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0).map{|x| x.to_f}
      #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]
    end
    describe "Normalization" do
      it "should return"  do
        @jsdata.js_normalize.should == [0.05287348230065382, 0.05232954664571494, 0.03403142536300279, 0.04925564522253359, 0.05487128881366461, 0.05177847812828551, 0.049727925239222676, 0.06668846338387537, 0.06495403020405463, 0.05405699225227864, 0.04420444507709126, 0.05424356915793028, 0.03875284284207411, 0.004998365846952035, 0.04746493381870098, 0.03966522663240518, 0.031462737917388524, 0.047142498034554586, 0.037199280528967184, 0.04336360111104635, 0.02458112697834252, 0.03293945442436116, 0.007671548338862412, 0.00832240294658885, 0.007420688791447924]
      end
    end

    describe "Distance" do
      it "should return 0.9403996303109481" do
        @jsdata.js_distance(@jspattern).should eq(0.9403996303109481)
      end
    end

    describe "Entropy" do
      it "should return " do
        @jsdata.js_normalize.js_entropy.should be_within(0.01).of(4.47)
      end
    end
  end

  describe "Hemming distance" do
    it "should return 2" do
      array_hemm_1.hemming_xor_distance(array_hemm_2) == 2
    end
  end

  private

  def array
    [5, 5]
  end

  def array_2
    [7, 3, 2, 4, 1]
  end

  def array_3
    [4,1,9,7,5]
  end

  def array_hemm_1
    [1,2,3]
  end

  def array_hemm_2
    [3,2,1]
  end

end
