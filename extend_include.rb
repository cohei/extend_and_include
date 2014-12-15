module M
  def m_instance_method
    true
  end

  def self.m_singleton_method
    true
  end
end

class Extended
  extend M
end

class Included
  include M
end

class O
end

require 'rspec'

describe 'extend_and_include' do
  # `extend` adds the instance methods of modules to the singleton class for `self`.
  # `include` adds the instance methods of modules to `self`.

  describe 'O.new' do
    let(:o) { O.new }

    context 'extend M' do
      subject { o.extend M }

      it { expect { subject }.not_to raise_error }

      describe 'm_instance_method' do
        it { expect(subject.m_instance_method).to be true }
      end

      describe 'm_singleton_method' do
        it { expect { subject.m_singleton_method }.to raise_error NoMethodError }
      end
    end

    context 'include M' do
      # You cannot `include` modules for objects already instantiated,
      # which are not able to make new instances any more from it.

      it { expect { o.include M }.to raise_error NoMethodError }
    end
  end

  describe M do
    describe 'm_instance_method' do
      it { expect { described_class.m_instance_method }.to raise_error NoMethodError }
    end

    describe 'm_singleton_method' do
      it { expect(described_class.m_singleton_method).to be true }
    end
  end

  describe Extended do
    context 'class' do
      describe 'm_instance_method' do
        it { expect(described_class.m_instance_method).to be true }
      end

      describe 'm_singleton_method' do
        it { expect { described_class.m_singleton_method }.to raise_error NoMethodError }
      end
    end

    context 'instance' do
      subject { described_class.new }

      describe 'm_instance_method' do
        it { expect { subject.m_instance_method }.to raise_error NoMethodError }
      end

      describe 'm_singleton_method' do
        it { expect { subject.m_singleton_method }.to raise_error NoMethodError }
      end
    end
  end

  describe Included do
    context 'class' do
      describe 'm_instance_method' do
        it { expect { described_class.m_instance_method }.to raise_error NoMethodError }
      end

      describe 'm_singleton_method' do
        it { expect { described_class.m_singleton_method }.to raise_error NoMethodError }
      end
    end

    context 'instance' do
      subject { described_class.new }

      describe 'm_instance_method' do
        it { expect(subject.m_instance_method).to be true }
      end

      describe 'm_singleton_method' do
        it { expect { subject.m_singleton_method }.to raise_error NoMethodError }
      end
    end
  end
end
