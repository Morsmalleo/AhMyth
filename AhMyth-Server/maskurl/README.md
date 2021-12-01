# MaskUrl

This simple Python Script masks the Phishing URL under the Normal URL. It generates a hidden URL for social engineering.

## Installation

```bash
$ git clone https://github.com/yogeshwaran01/maskurl
$ cd maskurl
$ python3 maskurl.py
```

![example](sample.png)

## Usage

```bash
$ python3 maskurl.py --target https://google.com --mask https://instagram.com --keywords free-likes
```

```log
--target        Target URL to Mask (With http or https)

--mask          Mask URL (With http or https)

--keywords      Keywords (Use (-) instead of whitespace)
```

Simple Usage

```bash
$ python3 maskurl.py 
```

## Legal Disclaimer

Usage of MaskUrl for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program

## Credits

This Scrpit is inspired from [jaykali's maskphish](https://github.com/jaykali/maskphish)
