from faker import Faker

fake = Faker()

for i in range(46):
    print(fake.city())