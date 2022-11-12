# frozen_string_literal: true

# ScoutApm uses blank? method in source code to check domain presence for external services
class String
  BLANK_RE = /\A[[:space:]]*\z/.freeze

  def blank?
    empty? || BLANK_RE.match?(self)
  end
end
