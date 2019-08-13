# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class HunspellDictKo < Formula
  desc "Korean spellchecking dictionary for Hunspell"
  homepage "https://spellcheck-ko.github.io/"
  version "0.7.91"
  url "https://github.com/spellcheck-ko/hunspell-dict-ko/releases/download/#{version}/ko-aff-dic-#{version}.zip"
  sha256 "abb14a7f145cdd919951d364fc3a641444fd415ed306a1d867641d6d1f1e7d9f"

  def install
    prefix.install Dir["*"]
  end

  # ln: /Users/mckabi/Library/Spelling/ko.aff: Operation not permitted
  # def post_install
  #   home = ENV["HOME"]
  #   system "ln -s #{prefix}/ko.aff #{home}/Library/Spelling/ko.aff"
  #   system "ln -s #{prefix}/ko.dic #{home}/Library/Spelling/ko.dic"
  # end

  def caveats; <<~EOS
    Symlink ko.aff and ko.dic

    To uses,
      ln -sf $(brew --prefix #{name})/ko.aff ~/Library/Spelling/
      ln -sf $(brew --prefix #{name})/ko.dic ~/Library/Spelling/

    To global uses,
      sudo ln -sf $(brew --prefix #{name})/ko.aff /Library/Spelling/
      sudo ln -sf $(brew --prefix #{name})/ko.dic /Library/Spelling/
    EOS
  end
end
