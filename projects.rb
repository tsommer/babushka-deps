dep "jasper" do
  requires "ubuntu"

  requires "sphinx.src",
           "imagemagick.managed"
end

dep "dma" do
  requires "ubuntu"

  requires "openjdk-6-jdk.managed"
end

dep "radiopaedia" do
  requires "ubuntu"

  requires "libfreeimage-dev.managed"
end
