# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class HunspellDictKo < Formula
  desc "Korean spellchecking dictionary for Hunspell"
  homepage "https://spellcheck-ko.github.io/"
  version "0.7.94"
  url "https://github.com/spellcheck-ko/hunspell-dict-ko/releases/download/#{version}/ko-aff-dic-#{version}.zip"
  sha256 "c7252e2f6bf421e081a457ca007cd8a304ee2045947edba47b367db780e63c48"

  def install
    prefix.install Dir["*"]
  end

  # ln: /Users/foo/Library/Spelling/ko.aff: Operation not permitted
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
