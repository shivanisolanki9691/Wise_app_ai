class WiseApp < ApplicationRecord
  has_one_attached :icon
  enum app_type: { Text_Generator: "Text_Generator", Chatbot: "Chatbot", Workflow: "Workflow", Recommended: "Recommended", Models: "Models", Copywriting: "Copywriting", Image: "Image", Business: "Business" }
end
