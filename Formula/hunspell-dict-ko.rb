# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class HunspellDictKo < Formula
  desc "Korean spellchecking dictionary for Hunspell"
  homepage "https://spellcheck-ko.github.io/"
  url "https://github.com/spellcheck-ko/hunspell-dict-ko/releases/download/0.7.90/ko-aff-dic-0.7.90.zip"
  version "0.7.90"
  sha256 "77d7ccf303f5252bdddb846f567cc63df312e6217df7c7521dc7e88630906eb5"

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
