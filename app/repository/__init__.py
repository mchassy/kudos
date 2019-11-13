""" This is a doc string for the Repository Module"""
class Repository():
    """ This is a doc string for the Repository Class"""
    def __init__(self, adapter=None):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        self.client = adapter()

    def find_all(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.client.find_all(selector)

    def find(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.client.find(selector)

    def create(self, kudo):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.client.create(kudo)

    def update(self, selector, kudo):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.client.update(selector, kudo)

    def delete(self, selector):
        """Used to test pylint. Put it in comment in order to trigger a convention violation."""
        return self.client.delete(selector)
