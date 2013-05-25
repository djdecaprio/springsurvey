class Survey < ActiveRecord::Base
  attr_accessible :age, :credits, :ecnounters, :gender, :gpa, :user_id

  def self.correlation_matrix
    the_encounters = Array.new
    the_ages = Array.new
    the_credits =Array.new
    the_gpas = Array.new


    the_responses = Survey.all(:conditions => ['ecnounters IS NOT NULL and age IS NOT NULL and credits IS NOT NULL and gpa IS NOT NULL'])

    the_responses.each do |response|
      the_encounters << response.ecnounters
      the_ages << response.age
      the_credits << response.credits
      the_gpas << response.gpa
    end

    the_matrix = Array.new
    the_matrix[0] = Array.new

    the_matrix[0] << correlate(the_encounters, the_encounters)
    the_matrix[0] << correlate(the_encounters, the_ages)
    the_matrix[0] << correlate(the_encounters, the_credits)
    the_matrix[0] << correlate(the_encounters, the_gpas)

    the_matrix[1] = Array.new

    the_matrix[1] << correlate(the_ages, the_encounters)
    the_matrix[1] << correlate(the_ages, the_ages)
    the_matrix[1] << correlate(the_ages, the_credits)
    the_matrix[1] << correlate(the_ages, the_gpas)

    the_matrix[2] = Array.new

    the_matrix[2] << correlate(the_credits, the_encounters)
    the_matrix[2] << correlate(the_credits, the_ages)
    the_matrix[2] << correlate(the_credits, the_credits)
    the_matrix[2] << correlate(the_credits, the_gpas)

    the_matrix[3] = Array.new

    the_matrix[3] << correlate(the_gpas, the_encounters)
    the_matrix[3] << correlate(the_gpas, the_ages)
    the_matrix[3] << correlate(the_gpas, the_credits)
    the_matrix[3] << correlate(the_gpas, the_gpas)

    return the_matrix
  end

  private

  def self.correlate(in_x, in_y)
    sum = 0.0
    for i in (0..in_x.size-1)
      sum += in_x[i] * in_y[i]
    end
    xymean = sum/in_x.size.to_f
    xmean = mean(in_x)
    ymean = mean(in_y)
    sx = sigma(in_x)
    sy = sigma(in_y)
    cor_mat = (xymean - (xmean*ymean))/(sx*sy)
    return cor_mat
  end

  def self.variance(x)
    m = mean(x)
    sum = 0.0
    x.each {|v| sum += (v-m)**2}
    sum/x.size
  end

  def self.sigma (x)
    Math.sqrt(variance(x))
  end

  def self.mean (x)
    x.sum / x.size.to_f
  end
end
