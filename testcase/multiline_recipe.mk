MAKEVER:=$(shell make --version | ruby -n0e 'puts $$_[/Make (\d)/,1]')
ifeq ($(MAKEVER),4)
AT=@
endif

# http://www.gnu.org/software/make/manual/make.html#Splitting-Recipe-Lines
# TODO: Fix the folloing case
test1:
	$(AT) echo no\
space
	$(AT) # echo no\
	# space
	$(AT) echo one \
	space
	$(AT) echo one\
	 space

test2:
	$(AT) for d in foo bar; do \
	  echo $$d ; done

define cmd3
echo foo
echo bar
endef

test3:
	$(cmd3)

define cmd4
echo foo ; \
echo bar
endef

test4:
	$(cmd4)

test5:
	$(AT) echo foo \
	$$empty bar

# TODO: Fix.
#test6:
#	echo foo\
#	$${empty}bar
