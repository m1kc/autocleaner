#!/usr/bin/env ruby

require './config.rb'

################################################################################
# Functions
################################################################################

def sanity_check!(folders)
	folders.each{|x|
		if x[:folder].nil? then raise ":folder not defined, source: #{x}" end
		if x[:days].nil? then raise ":days not defined, source: #{x}" end
	}
end

################################################################################
# Main
################################################################################

folders = Config::FOLDERS

sanity_check!(folders)

folders.each{|x|
	print("Processing: #{x}\n")
	pid = Process.spawn(
		{},
		["find", "find"],
		"-mtime", "+"+x[:days].to_s,
		"-type", "f",
		"-print",
		"-delete",
		:chdir=>x[:folder],
	)
	Process.wait pid
}
print("Done.\n")
