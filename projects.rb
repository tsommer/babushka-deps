dep "ubuntu-java" do
  requires "ubuntu"

  requires "openjdk-6-jdk.managed"
end

dep "jasper" do
  requires "ubuntu"

  requires "sphinx.src",
           "imagemagick.managed"
end

dep "dma" do
  requires "ubuntu-java"
end

dep "radiopaedia" do
  requires "ubuntu"

  requires "sphinx.src",
           "libfreeimage-dev.managed"
end

dep "jasperdocs" do
  requires "ubuntu-java"
end
