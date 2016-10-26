

def getMultipleOf35Under(max):
	res = 0
	for i in xrange(1,max):
		if i % 5 == 0:
			res = res + i
		elif i % 3 == 0:
			res = res + i
	return res

def main():
	assert getMultipleOf35Under(10) == 23
	print getMultipleOf35Under(1000)


if __name__ == "__main__":
	main()
