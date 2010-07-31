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
      [0.0, 0.0].cosine_similarity([0.0, 0.0]).nan?.should be_false
    end
  end

  describe "Tanimoto Coefficient" do
    it "should return 1.0" do
      array.tanimoto_coefficient(array).should == 1.0
    end

    it "should handle NaN's" do
      [0.0, 0.0].tanimoto_coefficient([0.0, 0.0]).nan?.should be_false
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

end
