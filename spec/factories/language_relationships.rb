FactoryGirl.define do
  factory :language_relationship, :class => 'LanguageRelationships' do
    user_id 1
language_id 1
relationship "MyString"
  end

end
