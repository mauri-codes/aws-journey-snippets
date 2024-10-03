rm -rf package package.zip
pip install \
   --platform manylinux2014_x86_64 \
   --target=package \
   --implementation cp \
   --python-version 3.9.16 \
   --only-binary=:all: --upgrade \
   -r requirements.txt
cp transform.py package/transform.py
