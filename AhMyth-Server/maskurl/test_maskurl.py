import unittest

import requests

from maskurl import MaskUrl


class TestMaskUrl(unittest.TestCase):

    """ Test cases for Url Masking """

    def setUp(self):
        self.test_url = "https://google.com"
        self.test_masking_url = "https://instagram.com"
        self.masked_url = MaskUrl(self.test_url, self.test_masking_url, "free-likes")
        self.response_masked_url = requests.get(self.masked_url.strip())

    def test_url_masking(self):
        self.assertTrue(self.response_masked_url.ok)


if __name__ == "__main__":
    unittest.main()
