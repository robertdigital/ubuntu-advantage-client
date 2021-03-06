import abc


class AutoAttachCloudInstance(metaclass=abc.ABCMeta):
    @property
    @abc.abstractmethod
    def identity_doc(self) -> str:
        """Return the identity document representing this cloud instance"""
        pass

    @property
    @abc.abstractmethod
    def cloud_type(self) -> str:
        """Return a string of the cloud type on which this instance runs"""
        pass

    @property
    @abc.abstractmethod
    def is_viable(self) -> bool:
        """Return True if the machine is a viable AutoAttachCloudInstance."""
        pass
